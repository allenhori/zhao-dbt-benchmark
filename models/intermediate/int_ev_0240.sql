select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 11.0, 4) as v1,
    coalesce(p.v5, 0) + 2 as v2,
    p.v6 * 3 as v3,
    p.v3 * 11 as v4,
    p.v5 + 3 as v5,
    case when p.v3 > 1300 then p.v3 else 0 end as v6
from {{ ref('int_ev_0020') }} as p
