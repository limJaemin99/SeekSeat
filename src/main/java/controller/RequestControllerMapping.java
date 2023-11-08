package controller;

import java.util.HashMap;
import java.util.Map;

import controller.QnA.QnAListViewController;
import controller.QnA.QnAReadViewController;
import controller.QnA.QnAUdateActionController;
import controller.QnA.QnAUdateViewController;
import controller.QnA.QnAWriteActionController;
import controller.QnA.QnAWriteViewController;
import controller.admin.Admin_StoreReadViewController;
import controller.admin.ownerInformationViewController;
import controller.admin.ownerProfileViewController;
import controller.admin.userInformationViewController;
import controller.admin.userProfileViewController;
import controller.community.DeleteCommunityActionController;
import controller.community.ListCommunityViewController;
import controller.community.ReadCommunityViewController;
import controller.community.ReplyActionController;
import controller.community.UpdateCommunityActionController;
import controller.community.UpdateCommunityViewController;
import controller.community.WriteActionController;
import controller.community.WriteViewController;
import controller.favorite.DeleteFavoriteActionController;
import controller.favorite.FavoriteActionController;
import controller.favorite.UserFavoriteViewController;
import controller.home.HomeViewController;
import controller.login.FindPasswordViewController;
import controller.login.LoginActionController;
import controller.login.LoginForReserveViewController;
import controller.login.LoginViewController;
import controller.login.LogoutActionController;
import controller.login.MailCheckController;
import controller.login.MailCheckViewController;
import controller.login.ResetPasswordActionController;
import controller.login.ResetPasswordViewController;
import controller.login.SignUpActionController;
import controller.login.UserInfoActionController;
import controller.login.UserInfoViewController;
import controller.menu.DeleteMenuActionController;
import controller.menu.MenuListViewController;
import controller.menu.RegisterMenuActionController;
import controller.menu.RegisterMenuViewController;
import controller.menu.UpdateMenuActionController;
import controller.menu.UpdateMenuViewController;
import controller.myPage.MyPageViewController;
import controller.myPage.UserReadViewController;
import controller.myPage.UserUpdateActionController;
import controller.myPage.UserUpdateViewController;
import controller.reserve.ReservationViewController;
import controller.search.SearchViewController;
import controller.store.DeleteStoreActionController;
import controller.store.RegisterStoreActionController;
import controller.store.RegisterStoreViewController;
import controller.store.StoreListViewController;
import controller.store.StoreReadViewController;
import controller.store.UpdateStoreActionController;
import controller.store.UpdateStoreViewController;
import controller.table.RegisterTableActionController;
import controller.table.RegisterTableViewController;


public class RequestControllerMapping {
	private static final Map<RequestMap,Controller> mapping = new HashMap<>();
	
	public static void init() {
		//홈으로 이동
		mapping.put(new RequestMap("/home","GET"), new HomeViewController());
		
		//로그아웃 후 홈으로 이동
		mapping.put(new RequestMap("/index", "GET"), new LogoutActionController());

		//로그인/로그아웃/회원가입/비밀번호 변경
		mapping.put(new RequestMap("/jsp/login/login","GET"), new LoginViewController());
		mapping.put(new RequestMap("/jsp/login/login", "POST"), new LoginActionController());
		mapping.put(new RequestMap("/jsp/login/join", "POST"), new SignUpActionController());
		mapping.put(new RequestMap("/jsp/login/findPassword","GET"), new FindPasswordViewController()); 
		mapping.put(new RequestMap("/jsp/login/mailCheck","GET"), new MailCheckViewController()); 
		mapping.put(new RequestMap("/jsp/login/forgotPassword","POST"), new MailCheckController());
		mapping.put(new RequestMap("/jsp/login/resetPassword","GET"), new ResetPasswordViewController());
		mapping.put(new RequestMap("/jsp/login/resetPassword","POST"), new ResetPasswordActionController());
		mapping.put(new RequestMap("/jsp/login/loginForReserve","GET"), new LoginForReserveViewController());
		
		//1:1 문의
		mapping.put(new RequestMap("/jsp/QnA/list","GET"), new QnAListViewController());
		mapping.put(new RequestMap("/jsp/QnA/write","GET"), new QnAWriteViewController());
		mapping.put(new RequestMap("/jsp/QnA/write","POST"), new QnAWriteActionController());
		mapping.put(new RequestMap("/jsp/QnA/read","GET"), new QnAReadViewController());
		mapping.put(new RequestMap("/jsp/QnA/update","GET"), new QnAUdateViewController());
		mapping.put(new RequestMap("/jsp/QnA/update","POST"), new QnAUdateActionController());
		
		//마이페이지/내정보
		mapping.put(new RequestMap("/jsp/mypage/main","GET"), new MyPageViewController());
		mapping.put(new RequestMap("/jsp/mypage/userInfo","GET"), new UserInfoViewController());
		mapping.put(new RequestMap("/jsp/mypage/userInfo","POST"), new UserInfoActionController());
		mapping.put(new RequestMap("/jsp/mypage/userUpdate","GET"), new UserUpdateViewController());
		mapping.put(new RequestMap("/jsp/mypage/userUpdate","POST"), new UserUpdateActionController());
		mapping.put(new RequestMap("/jsp/mypage/userRead","GET"), new UserReadViewController());
		mapping.put(new RequestMap("/jsp/mypage/userProfile","GET"), new userInformationViewController());
		mapping.put(new RequestMap("/jsp/mypage/ownerProfile","GET"), new ownerInformationViewController());
		mapping.put(new RequestMap("/jsp/mypage/userList","GET"), new userProfileViewController());
		mapping.put(new RequestMap("/jsp/mypage/ownerList","GET"), new ownerProfileViewController());
		mapping.put(new RequestMap("/jsp/mypage/storeRead","GET"), new Admin_StoreReadViewController());
		
		//커뮤니티 리스트/선택한 글 출력/글 작성/글 수정/글 삭제/댓글 등록
	    mapping.put(new RequestMap("/jsp/community/home","GET"), new ListCommunityViewController());
	    mapping.put(new RequestMap("/jsp/community/write","GET"), new WriteViewController());
	    mapping.put(new RequestMap("/jsp/community/write","POST"), new WriteActionController());
	    mapping.put(new RequestMap("/jsp/community/read", "GET"), new ReadCommunityViewController());
	    mapping.put(new RequestMap("/jsp/community/update","GET"), new UpdateCommunityViewController());
	    mapping.put(new RequestMap("/jsp/community/update","POST"), new UpdateCommunityActionController());
	    mapping.put(new RequestMap("/jsp/community/delete","GET"), new DeleteCommunityActionController());
	    mapping.put(new RequestMap("/jsp/community/comments","POST"), new ReplyActionController());
		
	    //매장 정보
	    mapping.put(new RequestMap("/jsp/store/storeList","GET"), new StoreListViewController());
	    mapping.put(new RequestMap("/jsp/store/registerStoreInfo","GET"), new RegisterStoreViewController());
	    mapping.put(new RequestMap("/jsp/store/registerStoreInfo","POST"), new RegisterStoreActionController());
	    mapping.put(new RequestMap("/jsp/store/updateStoreInfo","GET"), new UpdateStoreViewController());
	    mapping.put(new RequestMap("/jsp/store/updateStoreInfo","POST"), new UpdateStoreActionController());
	    mapping.put(new RequestMap("/jsp/store/deleteStoreInfo","GET"), new DeleteStoreActionController());
	    mapping.put(new RequestMap("/jsp/store/menuList","GET"), new MenuListViewController());
	    mapping.put(new RequestMap("/jsp/store/storeMenu","GET"), new RegisterMenuViewController());
	    mapping.put(new RequestMap("/jsp/store/storeMenu","POST"), new RegisterMenuActionController());
	    mapping.put(new RequestMap("/jsp/store/updateMenuInfo","GET"), new UpdateMenuViewController());
	    mapping.put(new RequestMap("/jsp/store/updateMenuInfo","POST"), new UpdateMenuActionController());
	    mapping.put(new RequestMap("/jsp/store/deleteMenuInfo","GET"), new DeleteMenuActionController());
	    
	    //검색
		mapping.put(new RequestMap("/jsp/search/search","GET"), new SearchViewController());
		mapping.put(new RequestMap("/jsp/search/searchStoreInfo","GET"), new StoreReadViewController());
		
		//테이블
		mapping.put(new RequestMap("/jsp/table/registerTable","GET"), new RegisterTableViewController());
		mapping.put(new RequestMap("/jsp/table/registerTable","POST"), new RegisterTableActionController());
		
		//예약
		mapping.put(new RequestMap("/jsp/reserve/reservation","GET"), new ReservationViewController());
		
		//즐겨찾기
		mapping.put(new RequestMap("/jsp/favorite/favorite","GET"), new FavoriteActionController());
		mapping.put(new RequestMap("/jsp/favorite/userFavorite","GET"), new UserFavoriteViewController());
		mapping.put(new RequestMap("/jsp/favorite/deleteFavorite","GET"), new DeleteFavoriteActionController());
	}
	
	public static Controller getController(RequestMap key) {
		return mapping.get(key);
	}
}
