select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 5 as v1,
    coalesce(p.v6, 0) + 13 as v2,
    p.v6 + 11 as v3,
    p.v6 * 7 as v4,
    case when p.v4 > 200 then p.v4 else 0 end as v5,
    coalesce(p.v6, 0) + 2 as v6,
    round(p.v4 / 13.0, 4) as v7,
    round(p.v6 / 3.0, 4) as v8
from {{ ref('int_ev_0012') }} as p
