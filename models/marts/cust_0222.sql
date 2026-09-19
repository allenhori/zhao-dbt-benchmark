select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v1) as s1,
    max(p.v1) as s2,
    min(p.v3) as s3,
    median(p.v3) as s4
from {{ ref('int_ev_0169') }} as p
group by p.customer_id
