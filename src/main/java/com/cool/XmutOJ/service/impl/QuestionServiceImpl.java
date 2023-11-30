package com.cool.XmutOJ.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cool.XmutOJ.model.entity.Question;
import com.cool.XmutOJ.mapper.QuestionMapper;
import com.cool.XmutOJ.service.QuestionService;
import org.springframework.stereotype.Service;

/**
* @author Cool
* @description 针对表【question(题目)】的数据库操作Service实现
* @createDate 2023-11-30 14:56:38
*/
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question>
    implements QuestionService{

}




