select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 11.0, 4) as v1,
    p.v4 + 11 as v2,
    round(p.v4 / 2.0, 4) as v3,
    p.v4 * 2 as v4,
    p.v6 + 2 as v5,
    case when p.v2 > p.v4 then p.v2 else p.v4 end as v6,
    coalesce(p.v6, 0) + 7 as v7
from {{ ref('int_ev_0059') }} as p
