select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v8 / 11.0, 4) as v1,
    coalesce(p.v8, 0) + 2 as v2,
    p.v1 * 7 as v3,
    p.v8 + p.v6 as v4,
    coalesce(p.v1, 0) + 5 as v5,
    case when p.v8 > 500 then p.v8 else 0 end as v6
from {{ ref('int_ev_0001') }} as p
