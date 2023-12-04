package com.cool.XmutOJ.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cool.XmutOJ.common.ErrorCode;
import com.cool.XmutOJ.exception.BusinessException;
import com.cool.XmutOJ.mapper.QuestionSubmitMapper;
import com.cool.XmutOJ.model.dto.questionsubmit.JudgeInfo;
import com.cool.XmutOJ.model.dto.questionsubmit.QuestionSubmitAddRequest;
import com.cool.XmutOJ.model.entity.Question;
import com.cool.XmutOJ.model.entity.QuestionSubmit;
import com.cool.XmutOJ.model.entity.User;
import com.cool.XmutOJ.model.enums.QuestSubmitStatusEnum;
import com.cool.XmutOJ.model.enums.QuestionSubmitLanguageEnum;
import com.cool.XmutOJ.service.QuestionService;
import com.cool.XmutOJ.service.QuestionSubmitService;
import org.springframework.aop.framework.AopContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author Cool
 * @description 针对表【question_submit(题目提交)】的数据库操作Service实现
 * @createDate 2023-11-30 14:57:28
 */
@Service
public class QuestionSubmitServiceImpl extends ServiceImpl<QuestionSubmitMapper, QuestionSubmit>
        implements QuestionSubmitService {

    @Resource
    private QuestionService questionService;

    /**
     * 题目提交
     *
     * @param questionSubmitAddRequest
     * @param loginUser
     * @return
     */
    @Override
    public long doQuestionSubmit(QuestionSubmitAddRequest questionSubmitAddRequest, User loginUser) {
        // 校验编程语言是否合法
        String language = questionSubmitAddRequest.getSubmitLanguage();
        QuestionSubmitLanguageEnum languageEnum = QuestionSubmitLanguageEnum.getEnumByValue(language);
        if (languageEnum == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR,"编程语言错误");
        }
        // 判断实体是否存在，根据类别获取实体
        Long questionId = questionSubmitAddRequest.getQuestionId();
        Question question = questionService.getById(questionId);
        if (question == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR);
        }
        // 是否已题目提交
        long userId = loginUser.getId();
        // 每个用户串行题目提交
        QuestionSubmit questionSubmit = new QuestionSubmit();
        questionSubmit.setUserId(userId);
        questionSubmit.setQuestionId(questionId);
        questionSubmit.setSubmitCode(questionSubmitAddRequest.getSubmitCode());
        questionSubmit.setSubmitLanguage(language);
        questionSubmit.setSubmitState(QuestSubmitStatusEnum.WAITING.getValue());
        // 设置初始状态
        questionSubmit.setJudgeInfo("{}");
        boolean save = this.save(questionSubmit);
        if (!save) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "数据插入失败");
        }
        return questionSubmit.getId();
    }
}




