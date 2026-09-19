select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 0.5 + p.v1 * 0.5 as v1,
    p.v7 * 0.5 + p.v1 * 0.5 as v2,
    p.v6 * 11 as v3,
    p.v6 * 11 as v4,
    p.v6 + 3 as v5,
    case when p.v7 > 300 then p.v7 else 0 end as v6
from {{ ref('int_ev_0002') }} as p
where p.customer_id % 97 <> 0
