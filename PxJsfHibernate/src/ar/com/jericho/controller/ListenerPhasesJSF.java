package ar.com.jericho.controller;

import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;

import org.hibernate.classic.Session;

import ar.com.jericho.util.FacesContextUtil;
import ar.com.jericho.util.HibernateUtil;

public class ListenerPhasesJSF implements PhaseListener {

	@Override
	public void beforePhase(PhaseEvent fase) {
		//System.out.println("Antes fase :" + fase.getPhaseId());
		
		
		
		//-- Generamos una verificacion donde solo un usuario autenticado pueda navegar por el sistema --//
		if(fase.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
			LoginBean loginBean = (LoginBean)FacesContextUtil.getSessionAttribute("loginBean");//Castemos porque un object es devuelto
			
			//-- Verificamos si el usuario esta logueado --//
			if(loginBean == null || !loginBean.getAutenticado()){
				FacesContextUtil.setNavigation("login");
			}
		}
		
		
		if(fase.getPhaseId().equals(PhaseId.RESTORE_VIEW)){
			Session session =  HibernateUtil.getSessionfactory().openSession();
			session.beginTransaction();
			FacesContextUtil.setRequestSession(session);
		}
		
	}

	@Override
	public void afterPhase(PhaseEvent fase) {
		System.out.println("Despues fase :" + fase.getPhaseId());
		if(fase.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
			Session session = FacesContextUtil.getRequestSession();
			try {
				session.beginTransaction().commit();
			} catch (Exception e) {
				System.out.println("Error al hacer commit en la transaccion :"+e.getMessage());
				if(session.getTransaction().isActive()){
					session.getTransaction().rollback();
				}
			}finally{
				session.close();
			}
			
		}

	}


	@Override
	public PhaseId getPhaseId() {
		return PhaseId.ANY_PHASE;
	}

}
