select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 700 then p.v4 else 0 end as v1,
    case when p.v4 > 500 then p.v4 else 0 end as v2,
    coalesce(p.v1, 0) + 3 as v3,
    case when p.v1 > 1300 then p.v1 else 0 end as v4,
    p.v4 * 13 as v5,
    p.v4 * 0.5 + p.v1 * 0.5 as v6,
    round(p.v4 / 5.0, 4) as v7
from {{ ref('int_ev_0057') }} as p
