select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1300 then p.v3 else 0 end as v1,
    p.v3 + 5 as v2,
    round(p.v3 / 5.0, 4) as v3,
    round(p.v3 / 5.0, 4) as v4,
    p.v8 * 13 as v5,
    p.v3 - p.v8 as v6,
    p.v8 * 11 as v7
from {{ ref('int_ev_0070') }} as p
