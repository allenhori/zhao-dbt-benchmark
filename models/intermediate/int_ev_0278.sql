select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 + p.v6 as v1,
    p.v6 * 0.5 + p.v7 * 0.5 as v2,
    case when p.v6 > 500 then p.v6 else 0 end as v3,
    round(p.v6 / 5.0, 4) as v4,
    p.v7 * 0.5 + p.v6 * 0.5 as v5,
    p.v6 + 3 as v6,
    p.v7 + 5 as v7
from {{ ref('int_ev_0024') }} as p
