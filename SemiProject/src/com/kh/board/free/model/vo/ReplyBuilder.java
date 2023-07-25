package com.kh.board.free.model.vo;

public class ReplyBuilder {

	private int replyNo;
	private String replyContent;
	private int refBno;
	
	private ReplyBuilder() {
		super();
	}
	
	public static class Builder {
		
		private int replyNo;
		private String replyContent;
		private int refBno;
		
		public Builder(int replyNo) {
			this.replyNo = replyNo;
		}
		
		public Builder setReplyContent(String replyContent) {
			this.replyContent = replyContent;
			
			return this; 
		}
		
		public Builder setRefBno(int refBno) {
			this.refBno = refBno;
			
			return this;
		}
		
		public ReplyBuilder build() {
			
			ReplyBuilder rb = new ReplyBuilder();
			rb.replyNo = this.replyNo;
			rb.replyContent = this.replyContent;
			rb.refBno = this.refBno;
			
			return rb;
		}
		
	}
}
