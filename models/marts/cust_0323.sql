select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    avg(p.v6) as s2,
    median(p.v6) as s3,
    min(p.v3) as s4,
    median(p.v6) as s5,
    sum(p.v2) as s6
from {{ ref('int_ev_0408') }} as p
group by p.customer_id
