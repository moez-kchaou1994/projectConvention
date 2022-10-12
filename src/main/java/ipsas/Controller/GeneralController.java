package ipsas.Controller;
/**
* @Author -- Moez Kchaou
*/
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.CMYKColor;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import java.util.*;
import ipsas.dao.ContactDaoHib;
import ipsas.dao.ConventionDaoHib;
import ipsas.dao.ParticipantDaoHib;
import ipsas.model.Contact;
import ipsas.model.Convention;
import ipsas.model.Participant;
import java.io.*;
import java.text.*;
import com.lowagie.text.pdf.PdfPCell;


/**
 * Servlet implementation class ContactController
 */
@WebServlet("")
public class GeneralController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/IPSAS/convention.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action = request.getParameter("action");
		
		switch (action) {	
		case "insertconvention":
			insertconvention(request, response);
		case "deleteconvention":
			Deleteconvention(request, response);
			break;
		case "editconvention":
			Editconvention(request, response);
			break;
		case "findconventionbytype":
			Findconventionbytype(request, response);
			break;
		case "findconventionbydateedition":
			Findconventionbydateedition(request, response);
			break;
		case "findconventionbydatesignature":
			Findconventionbydatesignature(request, response);
			break;
		case "findconventionbystartdate":
			Findconventionbystartdate(request, response);
			break;
		case "findconventionbydateexpiry":
			Findconventionbydateexpiry(request, response);
			break;
		case "findconventionbyparticipant":
			findconventionbyparticipant(request, response);
			break;
		case "findconventionbyobject":
			Findconventionbyobject(request, response);
			break;
		case "sendidconv":
			Sendidconv(request, response);
			break;
		case "editparticipant":
			Editparticipant(request, response);
			break;
		case "exportpdfconvention":
			Exportpdfconvention(request, response);
			break;
		case "deleteparticipant":
			deleteparticipant(request, response);
			break;
		case "deletecontact":
            deletecontact(request, response);
            break;	
		case "insertcontact":
			insertcontact(request, response);
			break;
		case "editcontact":
			editcontact(request, response);
			break;
			
			
			
		}
	}
		
		public void Deleteconvention (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			int id_conv = Integer.parseInt(request.getParameter("id_conv"));
	        ConventionDaoHib.deleteconvention(id_conv);
	        response.sendRedirect("IPSAS/indexconvention.jsp");
	        session.setAttribute("allconvention", ConventionDaoHib.findAll());
	       
			
			
		}	
		
		public void insertconvention (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			Convention convention = new Convention();
			convention.setDate_edition( request.getParameter("date_edition") );
			convention.setDate_signature( request.getParameter("date_signature") );
			convention.setStart_date( request.getParameter("start_date") );
			convention.setDate_expiry( request.getParameter("date_expiry") );
			convention.setObject( request.getParameter("object") );
			convention.setType( request.getParameter("type") );
			convention.setDate_edition( request.getParameter("date_edition") );
			//
			String[] participantIds = request.getParameterValues("participant");
			for( String pId: participantIds ) {
				Participant p = ParticipantDaoHib.findByidparticpant(Integer.parseInt(pId));
				convention.addParticipant(p);
			}
			ConventionDaoHib.save(convention);
			session.setAttribute("allconvention", ConventionDaoHib.findAll());
			//response.sendRedirect("IPSAS/indexconvention.jsp");
			request.getServletContext().getRequestDispatcher("/IPSAS/indexconvention.jsp").forward(request, response);
		}	
		public void Sendidconv (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			int id_conv =Integer.parseInt(request.getParameter("id_conv"));
			ConventionDaoHib.findByIDConv(id_conv);
	        response.sendRedirect("IPSAS/editconvention.jsp");
	        session.setAttribute("idconvention", ConventionDaoHib.findByIDConv(id_conv));
		}
		public void Editconvention (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			int id_conv =Integer.parseInt(request.getParameter("id_conv"));
			
			String type = request.getParameter("type");
	        String date_edition = request.getParameter("date_edition");
	        String date_signature = request.getParameter("date_signature");
	        String object = request.getParameter("object");
	        String start_date = request.getParameter("start_date");
	        String date_expiry = request.getParameter("date_expiry");
	        Convention convention = new Convention(id_conv,type, date_edition, date_signature,object,start_date,date_expiry);
	        String[] participantIds = request.getParameterValues("participant");
			for( String pId: participantIds ) {
				Participant p = ParticipantDaoHib.findByidparticpant(Integer.parseInt(pId));
				convention.addParticipant(p);
			}
	        ConventionDaoHib.editconvention(convention);
	        response.sendRedirect("IPSAS/indexconvention.jsp");
	        session.setAttribute("allconvention", ConventionDaoHib.findAll());
		}	
		public void Findconventionbytype (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String type = request.getParameter("type");	
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention", ConventionDaoHib.findBytype(type));
			
		}
		public void Findconventionbydateedition (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String date_edition = request.getParameter("date_edition");	
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention", ConventionDaoHib.findBydateedition(date_edition));
			
		}
		public void Findconventionbydatesignature (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String date_signature = request.getParameter("date_signature");	
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention", ConventionDaoHib.findBydatesignature(date_signature));
			
		}
		public void Findconventionbystartdate (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String start_date = request.getParameter("start_date");	
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention", ConventionDaoHib.findBystartdate(start_date));
			
		}
		
		public void Findconventionbydateexpiry (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String date_expiry = request.getParameter("date_expiry");	
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention", ConventionDaoHib.findBydateexpiry(date_expiry));
			
		}
		//
		public void Findconventionbyobject(HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String object = request.getParameter("object");	
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention", ConventionDaoHib.findobject(object));
			
		}
		public void findconventionbyparticipant(HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			String[] participant = request.getParameterValues("participant");
			Collection <Convention> c = new ArrayList<Convention>();
			for( String pId: participant ) {
				Participant p = ParticipantDaoHib.findByidparticpant(Integer.parseInt(pId));
				for (Convention cc:p.getConventions()) {
				c.add(cc);
				}
				
			}
			response.sendRedirect("IPSAS/rechconvention.jsp");
			session.setAttribute("fconvention",c);
		}
		
		public void Exportpdfconvention (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			// Create the Object of Document
			  Document document = new Document(PageSize.A4);
			  // get the document and write the response to output stream
			  PdfWriter.getInstance(document, response.getOutputStream());
			  document.open();
			  // Add Font
			  Font fontTiltle = FontFactory.getFont(FontFactory.TIMES_ROMAN);
			  fontTiltle.setSize(20);
			                // Create Object of Paragraph
			  Paragraph paragraph = new Paragraph("Print Convention", fontTiltle);
			  paragraph.setAlignment(Paragraph.ALIGN_CENTER);
			  // Add to the document
			  document.add(paragraph);
			  PdfPTable table = new PdfPTable(6);
			  table.setWidthPercentage(100f);
			  table.setWidths(new int[] { 3, 3, 3, 4, 3,3 });
			  table.setSpacingBefore(6);
			  table.setSpacingAfter(20);
			  // Create Table Header
			  PdfPCell cell = new PdfPCell();
			  cell.setBackgroundColor(CMYKColor.YELLOW);
			  cell.setPadding(10);
			  ////
			  PdfPTable table1 = new PdfPTable(1);
			  table1.setWidthPercentage(100f);
			  table1.setWidths(new int[] { 10 });
			  table1.setSpacingBefore(1);
			  table1.setSpacingAfter(20);
			  ////////////////////////////
			  PdfPTable table2 = new PdfPTable(1);
			  table2.setWidthPercentage(100f);
			  table2.setWidths(new int[] { 10 });
			  table2.setSpacingBefore(1);
			  table2.setSpacingAfter(20);
			  ///////////////////////////
			  // Create Table Header
			  PdfPCell cell1 = new PdfPCell();
			  cell1.setBackgroundColor(CMYKColor.YELLOW);
			  cell1.setPadding(6);
			  //////
			  PdfPCell cell2 = new PdfPCell();
			  cell2.setBackgroundColor(CMYKColor.YELLOW);
			  cell2.setPadding(6);
			  /////
			  ////
			  // Add Font
			  Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
			  font.setColor(CMYKColor.RED);
			  cell.setPhrase(new Phrase("Type", font));
			  table.addCell(cell);
			  cell.setPhrase(new Phrase("Date Edition", font));
			  table.addCell(cell);
			  cell.setPhrase(new Phrase("Date Signature", font));
			  table.addCell(cell);
			  cell.setPhrase(new Phrase("Object", font));
			  table.addCell(cell);
			  cell.setPhrase(new Phrase("Start Date", font));
			  table.addCell(cell);
			  cell.setPhrase(new Phrase("Date Expiry", font));
			  table.addCell(cell);
			  cell1.setPhrase(new Phrase("Participant", font));
			  table1.addCell(cell1);
			  cell2.setPhrase(new Phrase("Convention Status", font));
			  table2.addCell(cell2);
			 
			  String type = request.getParameter("type");
		        String date_edition = request.getParameter("date_edition");
		        String date_signature = request.getParameter("date_signature");
		        String object = request.getParameter("object");
		        String start_date = request.getParameter("start_date");
		        String date_expiry = request.getParameter("date_expiry");
		        String[] participant = request.getParameterValues("participants");
			  	   table.addCell(String.valueOf(type));
			  	   table.addCell(String.valueOf(date_edition));
			  	   table.addCell(String.valueOf(date_signature));
			  	   table.addCell(String.valueOf(object));
			  	   table.addCell(String.valueOf(start_date));
			  	   table.addCell(String.valueOf(date_expiry));
			  	 
			  	  
			  	 for ( int i =0; i < participant.length; i ++ ) {
			  		//System.out.println("list" + participant[i]);
			  		table1.addCell(String.valueOf(participant[i]));
			  		}
			  	String today=java.time.LocalDate.now().toString();
			  	
			  	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			  	Date today1 = null;
				try {
					today1 = formatter.parse(today);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
			    Date date_expiry1 = null;
				try {
					date_expiry1 = formatter.parse(date_expiry);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			      
			      Boolean bool1 = today1.after(date_expiry1);  
			      Boolean bool2 = today1.before(date_expiry1);
			      Boolean bool3 = today1.equals(date_expiry1);
			      if(bool1) {
			    	  System.out.println("expired");
			    	  table2.addCell("Convention Expired");
			    	  
			      }else if(bool2){
			          System.out.println("Convention Valid.");
			          table2.addCell("Convention Valid");
			       
		}else if(bool3){
	          System.out.println("Convention last day.");
	          table2.addCell("This convention is valid until the end of this day.");
	       }
			  // Add table to document
			  document.add(table);
			  document.add(table1);
			  document.add(table2);
			  document.close();		
		}
				
				public void deleteparticipant (HttpServletRequest request, HttpServletResponse response) 
						throws  IOException, ServletException {
					HttpSession session = request.getSession();
					int id_participant = Integer.parseInt(request.getParameter("id_participant"));
			       ParticipantDaoHib.deleteparticipant(id_participant);
			        response.sendRedirect("IPSAS/participant.jsp");
			       //request.getServletContext().getRequestDispatcher("/IPSAS/participant.jsp").forward(request, response);
			        session.setAttribute("listparticipants", ParticipantDaoHib.findAllparticipant());
			       
					
					
				}
				public void Editparticipant (HttpServletRequest request, HttpServletResponse response) 
						throws  IOException, ServletException {
					HttpSession session = request.getSession();
					int id_participant =Integer.parseInt(request.getParameter("id_participant"));
			        String participant = request.getParameter("participant");
			        
			        Participant participants = new Participant(id_participant,participant);
			        ParticipantDaoHib.editparticipant(participants);
			        response.sendRedirect("IPSAS/participant.jsp");
			        session.setAttribute("listparticipants", ParticipantDaoHib.findAllparticipant());
					
					
				}	
				
		public void insertcontact (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException {
			Contact contact = new Contact();
			contact.setName(request.getParameter("name"));
			contact.setEmail(request.getParameter("email"));
			contact.setPhone(request.getParameter("phone"));
			contact.setMessage(request.getParameter("message"));
			ContactDaoHib.save(contact);
			response.sendRedirect("IPSAS/about.jsp");
		}
		public void deletecontact (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			int id_contact = Integer.parseInt(request.getParameter("id_contact"));
	        ContactDaoHib.deletecontact(id_contact);
	        response.sendRedirect("IPSAS/listcontact.jsp");
	        session.setAttribute("listcontact", ContactDaoHib.findAll());
	       
			
			
		}	
		public void editcontact (HttpServletRequest request, HttpServletResponse response) 
				throws  IOException, ServletException {
			HttpSession session = request.getSession();
			int id_contact =Integer.parseInt(request.getParameter("id_contact"));
			String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String message = request.getParameter("message");
	        Contact contact = new Contact(id_contact, name, email, phone,message);
	        ContactDaoHib.editcontact(contact);
	        response.sendRedirect("IPSAS/listcontact.jsp");
	        session.setAttribute("listcontact", ContactDaoHib.findAll());
			
			
		}	
		
}
