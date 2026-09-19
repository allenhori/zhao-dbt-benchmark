select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 3.0, 4) as v1,
    coalesce(p.v4, 0) + 11 as v2,
    p.v3 * 3 as v3,
    round(p.v4 / 13.0, 4) as v4,
    case when p.v2 > 300 then p.v2 else 0 end as v5,
    p.v3 * 3 as v6,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v7,
    round(p.v2 / 5.0, 4) as v8
from {{ ref('int_ev_0026') }} as p
