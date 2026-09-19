select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 13 as v1,
    p.v7 * 11 as v2,
    coalesce(p.v6, 0) + 11 as v3,
    case when p.v4 > 700 then p.v4 else 0 end as v4,
    coalesce(p.v4, 0) + 11 as v5,
    p.v4 + 2 as v6,
    coalesce(p.v4, 0) + 2 as v7
from {{ ref('int_ev_0214') }} as p
