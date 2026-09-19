select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 1300 then p.v2 else 0 end as v1,
    round(p.v3 / 13.0, 4) as v2,
    round(p.v2 / 2.0, 4) as v3,
    p.v2 * 5 as v4,
    p.v3 + 3 as v5,
    case when p.v2 > p.v3 then p.v2 else p.v3 end as v6,
    p.v3 - p.v2 as v7
from {{ ref('int_ev_0280') }} as p
where p.customer_id % 97 <> 0
