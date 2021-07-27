package com.wapl.app.common.dto;

import java.util.List;
import com.wapl.app.common.vo.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
  private int replyCnt;
  private List<ReplyVO> list;
}
