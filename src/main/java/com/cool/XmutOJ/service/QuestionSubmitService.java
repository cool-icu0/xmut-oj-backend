package com.cool.XmutOJ.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cool.XmutOJ.model.dto.questionsubmit.QuestionSubmitAddRequest;
import com.cool.XmutOJ.model.entity.QuestionSubmit;
import com.cool.XmutOJ.model.entity.User;

/**
* @author Cool
* @description 针对表【question_submit(题目提交)】的数据库操作Service
* @createDate 2023-11-30 14:57:28
*/
public interface QuestionSubmitService extends IService<QuestionSubmit> {

    /**
     * 题目提交
     *
     * @param questionSubmitAddRequest 题目提交信息
     * @param loginUser
     * @return
     */
    long doQuestionSubmit(QuestionSubmitAddRequest questionSubmitAddRequest, User loginUser);
}
