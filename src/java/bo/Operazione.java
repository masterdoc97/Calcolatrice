/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author matteo
 */
public class Operazione extends HttpServlet{
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    String num1S = request.getParameter("num1");
    String num2S = request.getParameter("num2");
    String op = request.getParameter("op");
    Double num1 = Double.parseDouble(num1S);
    Double num2 = Double.parseDouble(num2S);
    PrintWriter out = response.getWriter();
    String message=" Errore nella divisione.";
    if(op.equals("a")) message=""+ (num1+num2);
    else if(op.equals("s")) message=""+ (num1-num2);
    else if(op.equals("m")) message=""+ (num1*num2);
    else if(num2!=0) message =""+ (num1/num2);
    out.print(message);
  }
}
