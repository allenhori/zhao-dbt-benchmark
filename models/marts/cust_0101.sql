select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v7) as s1,
    median(p.v5) as s2,
    median(p.v7) as s3,
    min(p.v5) as s4
from {{ ref('int_ev_0286') }} as p
group by p.customer_id
