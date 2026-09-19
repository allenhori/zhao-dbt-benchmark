select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v6 / 5.0, 4) as v1,
    round(p.v6 / 11.0, 4) as v2,
    p.v6 * 3 as v3,
    p.v4 + 2 as v4,
    case when p.v3 > 1300 then p.v3 else 0 end as v5,
    p.v3 * 13 as v6,
    p.v4 + p.v3 as v7
from {{ ref('int_ev_0082') }} as p
