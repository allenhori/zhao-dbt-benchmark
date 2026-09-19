select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v8) as s1,
    max(p.v6) as s2,
    sum(p.v6) as s3,
    min(p.v1) as s4,
    median(p.v6) as s5
from {{ ref('int_ev_0256') }} as p
group by p.customer_id
