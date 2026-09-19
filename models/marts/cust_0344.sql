select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v4) as s1,
    sum(p.v4) as s2,
    avg(p.v6) as s3,
    avg(p.v4) as s4
from {{ ref('int_ev_0182') }} as p
group by p.customer_id
