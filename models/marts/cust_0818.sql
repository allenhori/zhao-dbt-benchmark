select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v6) as s1,
    min(p.v5) as s2,
    median(p.v6) as s3,
    max(p.v2) as s4
from {{ ref('int_ev_0174') }} as p
group by p.customer_id
