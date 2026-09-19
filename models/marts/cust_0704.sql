select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v6) as s1,
    min(p.v6) as s2,
    avg(p.v6) as s3,
    avg(p.v1) as s4
from {{ ref('int_ev_0373') }} as p
group by p.customer_id
