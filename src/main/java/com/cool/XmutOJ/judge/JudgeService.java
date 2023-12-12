package com.cool.XmutOJ.judge;

import com.cool.XmutOJ.model.entity.QuestionSubmit;

/**
 * 判题服务 ：执行代码
 */
public interface JudgeService {
    /**
     * 判题
     *
     * @param questionSubmitId
     * @return
     */
    QuestionSubmit doJudge(long questionSubmitId);
}