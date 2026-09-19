select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v1) as s1,
    min(p.v2) as s2,
    max(p.v2) as s3,
    max(p.v2) as s4,
    median(p.v2) as s5,
    min(p.v6) as s6
from {{ ref('int_ev_0435') }} as p
group by p.customer_id
