select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 5 as v1,
    case when p.v3 > 700 then p.v3 else 0 end as v2,
    p.v3 + 5 as v3,
    round(p.v5 / 13.0, 4) as v4,
    p.v3 * 0.5 + p.v5 * 0.5 as v5,
    case when p.v5 > 700 then p.v5 else 0 end as v6,
    round(p.v3 / 13.0, 4) as v7
from {{ ref('int_ev_0000') }} as p
