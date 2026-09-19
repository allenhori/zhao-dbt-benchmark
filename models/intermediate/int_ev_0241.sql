select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 0.5 + p.v5 * 0.5 as v1,
    case when p.v7 > 200 then p.v7 else 0 end as v2,
    p.v7 + 13 as v3,
    p.v6 * 0.5 + p.v7 * 0.5 as v4,
    case when p.v5 > 500 then p.v5 else 0 end as v5,
    round(p.v7 / 2.0, 4) as v6,
    p.v7 + p.v5 as v7
from {{ ref('int_ev_0132') }} as p
