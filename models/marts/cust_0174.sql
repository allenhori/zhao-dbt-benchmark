select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v6) as s1,
    avg(p.v4) as s2,
    max(p.v6) as s3,
    sum(p.v2) as s4
from {{ ref('int_ev_0279') }} as p
group by p.customer_id
