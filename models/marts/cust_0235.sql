select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    avg(p.v1) as s2,
    sum(p.v2) as s3,
    sum(p.v2) as s4
from {{ ref('int_ev_0320') }} as p
group by p.customer_id
