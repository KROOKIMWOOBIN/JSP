package Servlet.DB;

import java.time.LocalDateTime;

public class postDTO {
	private int postId; // 게시물의 고유 식별자로 사용될 수 있는 정수형 컬럼입니다.
    private String userId; // 게시물을 작성한 사용자의 아이디를 저장하는 외래 키(Foreign Key)입니다. users 테이블의 id 컬럼과 연결될 수 있습니다.
    private String title; // 게시물의 제목을 저장하는 컬럼입니다.
    private String content; // 게시물의 내용을 저장하는 컬럼입니다. 긴 텍스트(LOng Text) 형식으로 저장할 수 있습니다.
    
    public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
