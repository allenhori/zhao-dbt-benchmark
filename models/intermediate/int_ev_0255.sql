select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 - p.v2 as v1,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v2,
    p.v8 + 2 as v3,
    p.v8 + 3 as v4,
    p.v8 * 0.5 + p.v4 * 0.5 as v5,
    round(p.v8 / 11.0, 4) as v6
from {{ ref('int_ev_0000') }} as p
