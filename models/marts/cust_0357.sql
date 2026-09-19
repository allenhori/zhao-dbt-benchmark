select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v6) as s1,
    min(p.v3) as s2,
    sum(p.v6) as s3,
    max(p.v6) as s4,
    max(p.v3) as s5
from {{ ref('int_ev_0321') }} as p
group by p.customer_id
