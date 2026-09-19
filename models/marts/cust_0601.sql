select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v8) as s1,
    sum(p.v6) as s2,
    sum(p.v6) as s3,
    median(p.v6) as s4,
    min(p.v6) as s5
from {{ ref('int_ev_0249') }} as p
group by p.customer_id
