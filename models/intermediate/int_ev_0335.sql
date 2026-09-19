select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 13 as v1,
    round(p.v3 / 7.0, 4) as v2,
    p.v3 * 11 as v3,
    p.v2 + 11 as v4,
    coalesce(p.v2, 0) + 3 as v5,
    case when p.v3 > 300 then p.v3 else 0 end as v6,
    round(p.v3 / 5.0, 4) as v7
from {{ ref('int_ev_0030') }} as p
