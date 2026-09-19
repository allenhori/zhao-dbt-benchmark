select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v2) as s1,
    sum(p.v1) as s2,
    median(p.v2) as s3,
    min(p.v1) as s4
from {{ ref('int_ev_0163') }} as p
group by p.customer_id
