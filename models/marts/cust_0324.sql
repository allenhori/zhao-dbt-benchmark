select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v5) as s1,
    sum(p.v5) as s2,
    min(p.v1) as s3,
    max(p.v1) as s4,
    median(p.v6) as s5
from {{ ref('int_ev_0046') }} as p
group by p.customer_id
