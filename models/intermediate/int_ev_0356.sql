select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 0.5 + p.v3 * 0.5 as v1,
    p.v2 - p.v3 as v2,
    round(p.v2 / 2.0, 4) as v3,
    p.v3 + 2 as v4,
    p.v2 * 5 as v5,
    p.v3 + 5 as v6,
    case when p.v2 > 200 then p.v2 else 0 end as v7
from {{ ref('int_ev_0160') }} as p
where p.customer_id % 97 <> 0
