select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    avg(p.v3) as s2,
    avg(p.v3) as s3,
    sum(p.v4) as s4,
    avg(p.v4) as s5
from {{ ref('int_ev_0115') }} as p
group by p.customer_id
