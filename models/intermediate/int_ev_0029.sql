select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 13 as v1,
    p.v8 - p.v6 as v2,
    round(p.v6 / 13.0, 4) as v3,
    case when p.v3 > 300 then p.v3 else 0 end as v4,
    p.v3 - p.v6 as v5,
    p.v6 + p.v3 as v6
from {{ ref('int_ev_0001') }} as p
