select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    max(p.v4) as s2,
    min(p.v2) as s3,
    max(p.v2) as s4
from {{ ref('int_ev_0420') }} as p
group by p.customer_id
