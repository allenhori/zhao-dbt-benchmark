select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 11 as v1,
    coalesce(p.v5, 0) + 13 as v2,
    case when p.v5 > 1300 then p.v5 else 0 end as v3,
    p.v1 + 5 as v4,
    case when p.v5 > p.v1 then p.v5 else p.v1 end as v5,
    p.v5 * 7 as v6,
    round(p.v5 / 11.0, 4) as v7
from {{ ref('int_ev_0030') }} as p
