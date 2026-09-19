select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 7 as v1,
    round(p.v1 / 13.0, 4) as v2,
    round(p.v4 / 13.0, 4) as v3,
    case when p.v3 > 700 then p.v3 else 0 end as v4,
    p.v3 * 11 as v5,
    p.v3 - p.v1 as v6,
    p.v1 + 5 as v7,
    round(p.v4 / 11.0, 4) as v8
from {{ ref('int_ev_0029') }} as p
where p.customer_id % 97 <> 0
