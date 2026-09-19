select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v1) as s1,
    median(p.v5) as s2,
    max(p.v1) as s3,
    median(p.v1) as s4,
    median(p.v1) as s5
from {{ ref('int_ev_0302') }} as p
group by p.customer_id
