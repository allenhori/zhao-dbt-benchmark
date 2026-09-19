select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v4) as s1,
    min(p.v4) as s2,
    avg(p.v6) as s3,
    median(p.v4) as s4,
    max(p.v4) as s5
from {{ ref('int_ev_0162') }} as p
group by p.customer_id
