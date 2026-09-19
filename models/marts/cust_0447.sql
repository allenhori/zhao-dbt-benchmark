select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v6) as s1,
    min(p.v1) as s2,
    min(p.v1) as s3,
    median(p.v1) as s4,
    avg(p.v1) as s5
from {{ ref('int_ev_0370') }} as p
group by p.customer_id
