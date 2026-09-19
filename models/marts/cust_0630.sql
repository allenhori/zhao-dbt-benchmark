select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    sum(p.v3) as s2,
    max(p.v2) as s3,
    median(p.v5) as s4
from {{ ref('int_ev_0121') }} as p
group by p.customer_id
