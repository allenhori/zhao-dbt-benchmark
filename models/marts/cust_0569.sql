select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    max(p.v6) as s2,
    min(p.v4) as s3,
    avg(p.v4) as s4,
    median(p.v6) as s5
from {{ ref('int_ev_0157') }} as p
group by p.customer_id
