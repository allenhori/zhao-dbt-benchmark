select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v6) as s1,
    avg(p.v1) as s2,
    avg(p.v6) as s3,
    min(p.v5) as s4
from {{ ref('int_ev_0084') }} as p
group by p.customer_id
