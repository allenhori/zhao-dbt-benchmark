select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v2) as s1,
    avg(p.v6) as s2,
    min(p.v6) as s3,
    min(p.v6) as s4,
    sum(p.v2) as s5
from {{ ref('int_ev_0012') }} as p
group by p.customer_id
