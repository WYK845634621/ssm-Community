package com.yikai.community.bean;

import java.util.ArrayList;
import java.util.List;

public class CommunityExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CommunityExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCmyIdIsNull() {
            addCriterion("cmy_id is null");
            return (Criteria) this;
        }

        public Criteria andCmyIdIsNotNull() {
            addCriterion("cmy_id is not null");
            return (Criteria) this;
        }

        public Criteria andCmyIdEqualTo(Integer value) {
            addCriterion("cmy_id =", value, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdNotEqualTo(Integer value) {
            addCriterion("cmy_id <>", value, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdGreaterThan(Integer value) {
            addCriterion("cmy_id >", value, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("cmy_id >=", value, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdLessThan(Integer value) {
            addCriterion("cmy_id <", value, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdLessThanOrEqualTo(Integer value) {
            addCriterion("cmy_id <=", value, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdIn(List<Integer> values) {
            addCriterion("cmy_id in", values, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdNotIn(List<Integer> values) {
            addCriterion("cmy_id not in", values, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdBetween(Integer value1, Integer value2) {
            addCriterion("cmy_id between", value1, value2, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyIdNotBetween(Integer value1, Integer value2) {
            addCriterion("cmy_id not between", value1, value2, "cmyId");
            return (Criteria) this;
        }

        public Criteria andCmyNameIsNull() {
            addCriterion("cmy_name is null");
            return (Criteria) this;
        }

        public Criteria andCmyNameIsNotNull() {
            addCriterion("cmy_name is not null");
            return (Criteria) this;
        }

        public Criteria andCmyNameEqualTo(String value) {
            addCriterion("cmy_name =", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameNotEqualTo(String value) {
            addCriterion("cmy_name <>", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameGreaterThan(String value) {
            addCriterion("cmy_name >", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameGreaterThanOrEqualTo(String value) {
            addCriterion("cmy_name >=", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameLessThan(String value) {
            addCriterion("cmy_name <", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameLessThanOrEqualTo(String value) {
            addCriterion("cmy_name <=", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameLike(String value) {
            addCriterion("cmy_name like", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameNotLike(String value) {
            addCriterion("cmy_name not like", value, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameIn(List<String> values) {
            addCriterion("cmy_name in", values, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameNotIn(List<String> values) {
            addCriterion("cmy_name not in", values, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameBetween(String value1, String value2) {
            addCriterion("cmy_name between", value1, value2, "cmyName");
            return (Criteria) this;
        }

        public Criteria andCmyNameNotBetween(String value1, String value2) {
            addCriterion("cmy_name not between", value1, value2, "cmyName");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}